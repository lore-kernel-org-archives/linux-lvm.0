From: Anders Widman <andewid@tnonline.net>
Message-ID: <2160656500.20020927230655@tnonline.net>
Subject: Re: [linux-lvm] Limits
In-Reply-To: <695771C76AEED411A19800902771A5040158B633@NC10S106>
References: <695771C76AEED411A19800902771A5040158B633@NC10S106>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Date: Fri Sep 27 16:10:54 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Ryan Leathers <linux-lvm@sistina.com>

> Here is your answer taken from a document that helped me with the same
> question=EF=BF=BD
> http://www-106.ibm.com/developerworks/library/l-lvm2.html
> The extent size determines the maximum size that a logical volume can
> be. As you can see from the above output, a 4 MB extent size imposes a
> logical volume size limitation of 256 Gigabytes, which is an easily
> attainable logical volume size if you're adding several high-capacity
> drives to your volume group. If your volumes could end up being greater
> than 256 GB apiece, I recommend specifying a larger extent size at
> vgcreate time. Extents can range anywhere from 8 KB to 512 MB, and must
> always be a multiple of two. By increasing the extent size above 4 MB,
> the maximum physical volume size will be scaled accordingly, up to a
> maximum of 1 Petabyte (although the current real-world size limit is 2
> Terabytes on x86 systems).

I  thought this limitation (2TB) would be removed in newer kernels, or
am I mistaken?

- Anders


>  For example, if I wanted to create a volume
> group with 32 Megabyte extents, I'd type:=20

=20
> # vgcreate -s 32M main /dev/hda5
=20
=20
=20
=20
> -----Original Message-----
> From: Luke Reeves [mailto:luke@oceanlake.com]
> Sent: Friday, September 27, 2002 2:55 PM
> To: 'linux-lvm@sistina.com'
> Subject: [linux-lvm] Limits
=20
> What are the current limits (specifically on LVM 1.0.5) of each
> volume/disk?  I read 255GB in one of the docs.  Can anyone fill me in?
> Thanks.
>         Luke Reeves=20
>         luke@oceanlake.com=20
