InitSeelBonusStage: ; 0x25a7c
	ld a, [wd7c1]
	and a
	ret nz
	xor a
	ld [wd4c8], a
	ld [wStageCollisionState], a
	ld a, $1
	ld [wDisableHorizontalScrollForBallStart], a
	ld a, [wBallType]
	ld [wBallTypeBackup], a
	xor a
	ld [wd4c8], a
	ld [wBallType], a
	ld [wCompletedBonusStage], a
	ld hl, InitialSeelCoords
	ld de, wd76d
	call InitSeelPosition
	ld de, wd777
	call InitSeelPosition
	ld de, wd781
	call InitSeelPosition
	xor a
	ld [wd793], a
	ld [wd791], a
	ld [wd792], a
	ld [wd739], a
	ld bc, $0130  ; 1 minute 30 seconds
	callba StartTimer
	ld a, $11
	call SetSongBank
	ld de, $0003
	call PlaySong
	ret

InitSeelPosition: ; 0x25ad8
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ret

InitialSeelCoords:
; Seel 1
	db $00, $60 ; x coordinate
	db $00, $00 ; y coordinate
; Seel 2
	db $00, $20 ; x coordinate
	db $00, $1A ; y coordinate
; Seel 3
	db $00, $40 ; x coordinate
	db $00, $34 ; y coordinate
