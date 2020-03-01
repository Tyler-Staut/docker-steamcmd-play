FROM tylerstaut/source-servers

ENV GAME_NAME gesource
ENV GAME_ID 310

ENV GAME_PATH ${STEAMCMD_LOC}/${GAME_NAME}

RUN ${STEAMCMD} +login anonymous +force_install_dir ${GAME_PATH} +app_update ${GAME_ID} validate +quit

WORKDIR ${GAME_PATH}

ENTRYPOINT ["./srcds_run", "-game gesource"]

CMD ["+sv_lan", "1", "+map", "ge_archives"]
