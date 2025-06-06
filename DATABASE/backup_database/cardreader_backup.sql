PGDMP  ;                    |         
   CardReader    16.0    16.0 "               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16399 
   CardReader    DATABASE     �   CREATE DATABASE "CardReader" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "CardReader";
                postgres    false            �            1259    30808    account    TABLE     �   CREATE TABLE public.account (
    id integer NOT NULL,
    fullname character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE public.account;
       public         heap    postgres    false            �            1259    30807    account_id_seq    SEQUENCE     �   CREATE SEQUENCE public.account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.account_id_seq;
       public          postgres    false    218                       0    0    account_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.account_id_seq OWNED BY public.account.id;
          public          postgres    false    217            �            1259    30825    account_profile    TABLE     �   CREATE TABLE public.account_profile (
    id_number character varying(255) NOT NULL,
    account_id integer NOT NULL,
    user_token bytea NOT NULL,
    housing integer NOT NULL
);
 #   DROP TABLE public.account_profile;
       public         heap    postgres    false            �            1259    30817    building_info    TABLE     {   CREATE TABLE public.building_info (
    building_id integer NOT NULL,
    building_name character varying(255) NOT NULL
);
 !   DROP TABLE public.building_info;
       public         heap    postgres    false            �            1259    30816    building_info_building_id_seq    SEQUENCE     �   CREATE SEQUENCE public.building_info_building_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.building_info_building_id_seq;
       public          postgres    false    220                       0    0    building_info_building_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.building_info_building_id_seq OWNED BY public.building_info.building_id;
          public          postgres    false    219            �            1259    28944    guest_account    TABLE     �   CREATE TABLE public.guest_account (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password bytea NOT NULL,
    user_token bytea,
    token_expiration date NOT NULL
);
 !   DROP TABLE public.guest_account;
       public         heap    postgres    false            �            1259    28943    guest_account_id_seq    SEQUENCE     �   CREATE SEQUENCE public.guest_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.guest_account_id_seq;
       public          postgres    false    216                       0    0    guest_account_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.guest_account_id_seq OWNED BY public.guest_account.id;
          public          postgres    false    215            �            1259    30842    meal_balance    TABLE     �   CREATE TABLE public.meal_balance (
    account_id integer NOT NULL,
    role character varying(255) NOT NULL,
    swipes_remaining integer NOT NULL,
    dining_dollars real NOT NULL,
    meal_plan character varying(255) NOT NULL
);
     DROP TABLE public.meal_balance;
       public         heap    postgres    false            c           2604    30811 
   account id    DEFAULT     h   ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.account_id_seq'::regclass);
 9   ALTER TABLE public.account ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            d           2604    30820    building_info building_id    DEFAULT     �   ALTER TABLE ONLY public.building_info ALTER COLUMN building_id SET DEFAULT nextval('public.building_info_building_id_seq'::regclass);
 H   ALTER TABLE public.building_info ALTER COLUMN building_id DROP DEFAULT;
       public          postgres    false    220    219    220            b           2604    28947    guest_account id    DEFAULT     t   ALTER TABLE ONLY public.guest_account ALTER COLUMN id SET DEFAULT nextval('public.guest_account_id_seq'::regclass);
 ?   ALTER TABLE public.guest_account ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216                      0    30808    account 
   TABLE DATA           C   COPY public.account (id, fullname, username, password) FROM stdin;
    public          postgres    false    218   �'                 0    30825    account_profile 
   TABLE DATA           U   COPY public.account_profile (id_number, account_id, user_token, housing) FROM stdin;
    public          postgres    false    221   �(                 0    30817    building_info 
   TABLE DATA           C   COPY public.building_info (building_id, building_name) FROM stdin;
    public          postgres    false    220   l)                 0    28944    guest_account 
   TABLE DATA           ]   COPY public.guest_account (id, username, password, user_token, token_expiration) FROM stdin;
    public          postgres    false    216   *                 0    30842    meal_balance 
   TABLE DATA           e   COPY public.meal_balance (account_id, role, swipes_remaining, dining_dollars, meal_plan) FROM stdin;
    public          postgres    false    222   8*                  0    0    account_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.account_id_seq', 3, true);
          public          postgres    false    217                       0    0    building_info_building_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.building_info_building_id_seq', 13, true);
          public          postgres    false    219                       0    0    guest_account_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.guest_account_id_seq', 1, false);
          public          postgres    false    215            h           2606    30815    account account_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            postgres    false    218            n           2606    30831 $   account_profile account_profile_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_pkey PRIMARY KEY (id_number);
 N   ALTER TABLE ONLY public.account_profile DROP CONSTRAINT account_profile_pkey;
       public            postgres    false    221            j           2606    30824 -   building_info building_info_building_name_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.building_info
    ADD CONSTRAINT building_info_building_name_key UNIQUE (building_name);
 W   ALTER TABLE ONLY public.building_info DROP CONSTRAINT building_info_building_name_key;
       public            postgres    false    220            l           2606    30822     building_info building_info_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.building_info
    ADD CONSTRAINT building_info_pkey PRIMARY KEY (building_id);
 J   ALTER TABLE ONLY public.building_info DROP CONSTRAINT building_info_pkey;
       public            postgres    false    220            f           2606    28951     guest_account guest_account_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.guest_account
    ADD CONSTRAINT guest_account_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.guest_account DROP CONSTRAINT guest_account_pkey;
       public            postgres    false    216            o           2606    30832 /   account_profile account_profile_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);
 Y   ALTER TABLE ONLY public.account_profile DROP CONSTRAINT account_profile_account_id_fkey;
       public          postgres    false    4712    221    218            p           2606    30837 ,   account_profile account_profile_housing_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account_profile
    ADD CONSTRAINT account_profile_housing_fkey FOREIGN KEY (housing) REFERENCES public.building_info(building_id);
 V   ALTER TABLE ONLY public.account_profile DROP CONSTRAINT account_profile_housing_fkey;
       public          postgres    false    220    221    4716            q           2606    30847 )   meal_balance meal_balance_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.meal_balance
    ADD CONSTRAINT meal_balance_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(id);
 S   ALTER TABLE ONLY public.meal_balance DROP CONSTRAINT meal_balance_account_id_fkey;
       public          postgres    false    4712    218    222               �   x�E̻v�0  �9�
�TPF1E�y��.�	�L�_�n.w�
��V�FJ�`C�P��f�����;1!��z<���:�*зU����vf8S�[_/�z��U2ve��̜��ߞ�Oܟ̭k���n^�h��3�������L[+���hx�:;����%8����I�QtŻk���	?q>���Zm�Ǹ��̢4�������סp�א�hC� ��M�         �   x��ɑ1Dѳʘ	@l�/���6��?^
9;,\��W��k�P

[��RF�7���wa H�}#���`Yf/|�̷.�qol��������q�כ�]$���Vb���E²��^�ǝ��]�� ������C�B��*|�%�iD��Y�|�����8?�         �   x�%��
�0E�3_�P����qQQ�͈�:�&%�*��W�=�c`C�����V��֢8��X��Pr��3�ؗ(=�C���jP�d7��:
�e�PQPvhFp$A8��^Y�8�I��J��4���%�]�Y%/q��>%]����8            x������ � �         =   x�3�.)MI�+��4�4�3����/�M��2���q����d��e��`21z\\\ ���     