set -e

URL_PREFIX="https://phl.carto.com/api/v2/sql?filename=incidents_part1_part2&\
format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator&q=SELECT%20*%20,\
%20ST_Y(the_geom)%20AS%20lat,%20ST_X(the_geom)%20AS%20lng%20FROM%20\
incidents_part1_part2%20WHERE%20dispatch_date_time%20%3E=%20%27"
URL_SUFFIX="-01-01%27%20AND%20dispatch_date_time%20%3C%20%27"
URL_END="-01-01%27"

for YEAR in {2006..2019}; do
    ENDING_YEAR=$(( ${YEAR} +1 ))
    URL=${URL_PREFIX}${YEAR}${URL_SUFFIX}${ENDING_YEAR}${URL_END}
    LOCAL_PREFIX="data"
    LOCAL_FILE="${YEAR}_crime_incidents.csv.gz"
    LOCAL_PATH="${LOCAL_PREFIX}/${LOCAL_FILE}"

    echo "downloading ${URL} to ${LOCAL_PATH}"
    sudo mkdir -p ${LOCAL_PREFIX}
    wget ${URL} -O ${LOCAL_PATH} 
done