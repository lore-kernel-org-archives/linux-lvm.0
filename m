Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: what i need is a little attention-RE [linux-lvm] SoftRaid and LVM   Jean-Eric Cuendet
Date: Wed, 5 Sep 2001 09:57:47 +0200
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF404FF5@mailsrv.linkvest.com>
From: "Jean-Eric Cuendet" <Jean-Eric.Cuendet@linkvest.com>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> and one more question about the min-max
> i don't speak "C" can you tell me how to do it with pre
> linux-2.4.9patches wich i wont to aply to linux-2.4.10pre2=20
> and they are giving me problems=20
> with min-max definition

The min/max functions are simple functions that return the min/max of
two numbers.
Ex: min(3,4) return 3
Now, Linus has added a type to those functions in 2.4.8 (I think):
Ex: min(int, 3, 4) =3D 3
Or: min(float, -6.45, 4.5) =3D -6.45

So, either you change the call from:
min(a, b) to min(int,a,b)
Or you add the provided replacement functions:
#define min(a,b) (((a)<(b))?(a):(b))=20
#define max(a,b) (((a)>(b))?(a):(b))=20
At the *beginning* of the file (before anything else).

Note that these are not real functions but just macros. That's why it's
so simple (just add them and forget).

Bye
-jec
