FROM tylerstaut/source-servers

ENV GAME_NAME hl2mp
ENV GAME_ID 232370

ENV GAME_PATH ${STEAMCMD_LOC}/${GAME_NAME}

RUN ${STEAMCMD} +login anonymous +force_install_dir ${GAME_PATH} +app_update ${GAME_ID} validate +quit

WORKDIR ${GAME_PATH}

ENTRYPOINT ["./srcds_run", "-game hl2mp"]

CMD ["+sv_lan", "1", "+map", "dm_lockdown"]
