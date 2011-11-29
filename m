Message-ID: <4ED4AE0C.8010504@redhat.com>
Date: Tue, 29 Nov 2011 11:03:56 +0100
From: Heinz Mauelshagen <heinzm@redhat.com>
MIME-Version: 1.0
References: <20111128124632.GA17443@hulk.dreamhost.com>
In-Reply-To: <20111128124632.GA17443@hulk.dreamhost.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Recovering a volume after lost disk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: lvm@qasmos.net, LVM general discussion and development <linux-lvm@redhat.com>


vgreduce --removemissing $VGName ; vgchange -ay

Of course you'll loose any LV data on the lost drive.

Heinz

On 11/28/2011 01:46 PM, lvm@qasmos.net wrote:
> I have a file system that spanned two physical disks on my Linux machine =
but one disk was lost and had to be pulled out due to excessive errors.  Ar=
e there instructions anywhere for being able to truncate the file system to=
 the size of the good disk and mount it that way?  The disk that is left is=
 good so data in it should be intact.  It is just that volume manager comma=
nds don=E2=80=99t see the volume in it, only the disk group itself.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Heinz Mauelshagen                               +49 2626 141200
Consulting Development Engineer             FAX +49 2626 924446
Red Hat GmbH
Am Sonnenhang 11
56242 Marienrachdorf
Germany                                       heinzm@redhat.com
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
