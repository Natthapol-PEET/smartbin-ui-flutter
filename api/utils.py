import pygame

pygame.mixer.init()


def pygame_play_sound(filename: str) -> None:
    pygame.mixer.music.load("myFile.wav")
    pygame.mixer.music.play()
    while pygame.mixer.music.get_busy() == True:
        continue


def map_command(command: str) -> str:
    if command == 'greeting':
        return 'greeting.wav'
