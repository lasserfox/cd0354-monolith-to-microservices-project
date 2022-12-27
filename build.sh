docker login
for img_name in `ls -d uda*/ | cut -f1 -d'/'`
do
    docker build -t ${img_name} ./${img_name}
    docker tag ${img_name} lasserfox/${img_name}
    docker push lasserfox/${img_name}
done