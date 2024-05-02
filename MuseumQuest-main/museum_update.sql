PGDMP  0                     |            postgres    16.2    16.2 $    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     |   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4831                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16405    tblAdmin    TABLE     l   CREATE TABLE public."tblAdmin" (
    "idAdmin" integer NOT NULL,
    login text,
    "passwordHash" text
);
    DROP TABLE public."tblAdmin";
       public         heap    postgres    false            �            1259    16410    tblAdmin_idAdmin_seq    SEQUENCE     �   ALTER TABLE public."tblAdmin" ALTER COLUMN "idAdmin" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."tblAdmin_idAdmin_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    16411    tblBluetoothTag    TABLE     �   CREATE TABLE public."tblBluetoothTag" (
    "idBluetoothTag" integer NOT NULL,
    name text,
    "accelerationX" real,
    "accelerationY" real,
    acceleration real,
    mac text
);
 %   DROP TABLE public."tblBluetoothTag";
       public         heap    postgres    false            �            1259    16416 "   tblBluetoothTag_idBluetoothTag_seq    SEQUENCE     �   ALTER TABLE public."tblBluetoothTag" ALTER COLUMN "idBluetoothTag" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."tblBluetoothTag_idBluetoothTag_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    16398 
   tblExhibit    TABLE     a   CREATE TABLE public."tblExhibit" (
    name text,
    "imgLink" text,
    id integer NOT NULL
);
     DROP TABLE public."tblExhibit";
       public         heap    postgres    false            �            1259    16417    tblExhibitsInQuest    TABLE     �   CREATE TABLE public."tblExhibitsInQuest" (
    "idExhibitsInQuest" integer NOT NULL,
    "idQuest" integer NOT NULL,
    "idExhibit" integer NOT NULL
);
 (   DROP TABLE public."tblExhibitsInQuest";
       public         heap    postgres    false            �            1259    16420 (   tblExhibitsInQuest_idExhibitsInQuest_seq    SEQUENCE       ALTER TABLE public."tblExhibitsInQuest" ALTER COLUMN "idExhibitsInQuest" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."tblExhibitsInQuest_idExhibitsInQuest_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �            1259    16421    tblExtraQuestion    TABLE     }   CREATE TABLE public."tblExtraQuestion" (
    "idExtraQuestion" integer NOT NULL,
    "questionText" text,
    answer text
);
 &   DROP TABLE public."tblExtraQuestion";
       public         heap    postgres    false            �            1259    16426 $   tblExtraQuestion_idExtraQuestion_seq    SEQUENCE     �   ALTER TABLE public."tblExtraQuestion" ALTER COLUMN "idExtraQuestion" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."tblExtraQuestion_idExtraQuestion_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    16427    tblQuest    TABLE     |   CREATE TABLE public."tblQuest" (
    "idQuest" integer NOT NULL,
    name text,
    description text,
    "imgLink" text
);
    DROP TABLE public."tblQuest";
       public         heap    postgres    false            �            1259    16432    tblQuest_idQuest_seq    SEQUENCE     �   ALTER TABLE public."tblQuest" ALTER COLUMN "idQuest" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."tblQuest_idQuest_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            �          0    16405    tblAdmin 
   TABLE DATA           F   COPY public."tblAdmin" ("idAdmin", login, "passwordHash") FROM stdin;
    public          postgres    false    217   �(       �          0    16411    tblBluetoothTag 
   TABLE DATA           x   COPY public."tblBluetoothTag" ("idBluetoothTag", name, "accelerationX", "accelerationY", acceleration, mac) FROM stdin;
    public          postgres    false    219   �)       �          0    16398 
   tblExhibit 
   TABLE DATA           ;   COPY public."tblExhibit" (name, "imgLink", id) FROM stdin;
    public          postgres    false    216   *       �          0    16417    tblExhibitsInQuest 
   TABLE DATA           [   COPY public."tblExhibitsInQuest" ("idExhibitsInQuest", "idQuest", "idExhibit") FROM stdin;
    public          postgres    false    221   M+       �          0    16421    tblExtraQuestion 
   TABLE DATA           W   COPY public."tblExtraQuestion" ("idExtraQuestion", "questionText", answer) FROM stdin;
    public          postgres    false    223   �+       �          0    16427    tblQuest 
   TABLE DATA           M   COPY public."tblQuest" ("idQuest", name, description, "imgLink") FROM stdin;
    public          postgres    false    225   ",       �           0    0    tblAdmin_idAdmin_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."tblAdmin_idAdmin_seq"', 10, true);
          public          postgres    false    218            �           0    0 "   tblBluetoothTag_idBluetoothTag_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public."tblBluetoothTag_idBluetoothTag_seq"', 3, true);
          public          postgres    false    220            �           0    0 (   tblExhibitsInQuest_idExhibitsInQuest_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public."tblExhibitsInQuest_idExhibitsInQuest_seq"', 13, true);
          public          postgres    false    222            �           0    0 $   tblExtraQuestion_idExtraQuestion_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public."tblExtraQuestion_idExtraQuestion_seq"', 12, true);
          public          postgres    false    224            �           0    0    tblQuest_idQuest_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."tblQuest_idQuest_seq"', 4, true);
          public          postgres    false    226            6           2606    16434    tblAdmin tblAdmin_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."tblAdmin"
    ADD CONSTRAINT "tblAdmin_pkey" PRIMARY KEY ("idAdmin");
 D   ALTER TABLE ONLY public."tblAdmin" DROP CONSTRAINT "tblAdmin_pkey";
       public            postgres    false    217            8           2606    16436 $   tblBluetoothTag tblBluetoothTag_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."tblBluetoothTag"
    ADD CONSTRAINT "tblBluetoothTag_pkey" PRIMARY KEY ("idBluetoothTag");
 R   ALTER TABLE ONLY public."tblBluetoothTag" DROP CONSTRAINT "tblBluetoothTag_pkey";
       public            postgres    false    219            4           2606    16404    tblExhibit tblExhibit_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."tblExhibit"
    ADD CONSTRAINT "tblExhibit_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."tblExhibit" DROP CONSTRAINT "tblExhibit_pkey";
       public            postgres    false    216            :           2606    16438 *   tblExhibitsInQuest tblExhibitsInQuest_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public."tblExhibitsInQuest"
    ADD CONSTRAINT "tblExhibitsInQuest_pkey" PRIMARY KEY ("idExhibitsInQuest");
 X   ALTER TABLE ONLY public."tblExhibitsInQuest" DROP CONSTRAINT "tblExhibitsInQuest_pkey";
       public            postgres    false    221            <           2606    16440 &   tblExtraQuestion tblExtraQuestion_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public."tblExtraQuestion"
    ADD CONSTRAINT "tblExtraQuestion_pkey" PRIMARY KEY ("idExtraQuestion");
 T   ALTER TABLE ONLY public."tblExtraQuestion" DROP CONSTRAINT "tblExtraQuestion_pkey";
       public            postgres    false    223            >           2606    16442    tblQuest tblQuest_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."tblQuest"
    ADD CONSTRAINT "tblQuest_pkey" PRIMARY KEY ("idQuest");
 D   ALTER TABLE ONLY public."tblQuest" DROP CONSTRAINT "tblQuest_pkey";
       public            postgres    false    225            ?           2606    16443 2   tblExhibitsInQuest tblExhibitsInQuest_idQuest_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."tblExhibitsInQuest"
    ADD CONSTRAINT "tblExhibitsInQuest_idQuest_fkey" FOREIGN KEY ("idQuest") REFERENCES public."tblQuest"("idQuest");
 `   ALTER TABLE ONLY public."tblExhibitsInQuest" DROP CONSTRAINT "tblExhibitsInQuest_idQuest_fkey";
       public          postgres    false    221    4670    225            �   �   x�%�K�X1��q��_Q�҉Q������N�Q~�$���P&s����&M|G�X{�/�0��Zƻ*�/��$<x����F�VyP[��O�	}��5A��ֶ�	�)�<)w8���U��HvV�wr��O���P��L�dE'��.�N���5[Jٷ��2��+x���״'m�n�c�_�*ϡ{$�f	������E�uI	`m��W*��ƚ��&�SA�")K=C�f�c>��s��Up�      �   .   x�3�,IL7�@.#���r���C��W� #�	�      �   ;  x����N�@ @�g��YL��H�VKe�	a��,e��7��F�?pOr��Q�Y����'M��mz��%�Ʒ
��%��P4ZW�*�1gJm�M�FB✨�����{[?�&�2��>��u�k�܀�Ne����k�bT��}��щ6� 9�:��qH��h�&I$��9d���C-X���3�E��5�D�'#߶&e8��!|w9y�/�0�@�8��N�x��!:��m_D�o��ʲZ�`��HD�P�D�L�A!������*���3 ���Շ�{(�:�87F��T�de���}n1��T�      �   >   x����@�s���~�^���,�N*Z�����������n^m2�E��Ǔ/�F�.��	�      �   w   x�Uл�0D��[����zq�`\P3����� ���r�g\�G\��%^�w|�Id�,����b+�Y+�fU���5��n��:6�m����|�0���HgD�Q1c���r�      �   �  x��R�JQ��}�� ���@�EYX�x#�邥��DW�B��
QAO�nnnڮ�0���Y#��fwf�73�731�nX��Bo�q�\ޥ/Fr�x[c��;��h�;4B�G2
iF>o�C��:�7C|ʟh<�(�gH����QQd�@�Q&�kJ�V�Xۺ���C+�˅��]���K�d�y=��%����a:��LǛ�����ۣ��~�4�_M��h�֭ʎU�U�낺�d�z��_GJ��s���`�{@����V����C�D$"�E��B^��\�K�2T�K��$<1���=�P�>��A�[ `wP�1�d
!�T�J�æd	�,Cφ��F�p��;t��-^�?�����5E�3d����!В[�g��[�������o��     