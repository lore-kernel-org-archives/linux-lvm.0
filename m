Message-ID: <4ED4EA4A.1070907@redhat.com>
Date: Tue, 29 Nov 2011 15:20:58 +0100
From: Milan Broz <mbroz@redhat.com>
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
Content-Type: text/plain; charset="windows-1252"
To: lvm@qasmos.net, LVM general discussion and development <linux-lvm@redhat.com>


On 11/28/2011 01:46 PM, lvm@qasmos.net wrote:
> I have a file system that spanned two physical disks on my Linux
> machine but one disk was lost and had to be pulled out due to
> excessive errors.  Are there instructions anywhere for being able to
> truncate the file system to the size of the good disk and mount it
> that way?  The disk that is left is good so data in it should be
> intact.  It is just that volume manager commands don=E2=80=99t see the vo=
lume
> in it, only the disk group itself.

You can add "zero device" replacement for missing PV, then dd
to another disk and run fsck/mount/truncate it.

I had example how to do that in slide [3/6] missing PV example
http://mbroz.fedorapeople.org/talks/LinuxAlt2009_2/

(maybe there is better description somewhere, dunno.
There are some slides which need updates though but principle
is the same.)

Milan
