From: "William Blunn" <bill+f.9sfuw6uo@tao-group.com>
Subject: Re: [linux-lvm] lvm lowers transfer rate
Message-ID: <BDEMIPDEGABMNEFIHCPDKENADMAA.bill+f.9sfuw6uo@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <F153arcR4ZDgC81Tbdk00000012@hotmail.com>
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
Date: Thu Jul 25 03:53:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

> I have 4 fiber channel disks, on which I intend to build a logical
> volume using lvm. Before creating the logical volume, I run an I/O
> test on the disks, which revealed that the disks each would do
> 10MBytes/sec I/Os.
>
> However, when I create a logical volume, spanning all 4 disks using
> RAID0, I realize that the transfer rate now drops. Instead
> (10 * 4)MB/s, I get something close to 30MB/s. Am I doing something
> wrong?!?

10 MB/s ?

How are you measuring your data transfer rate?

Measured using "hdparm -t", a single Maxtor D740X IDE drive
(80GB =3D GBP=A372.00 or USD$113) will shift about 39 MB/s.

Bill

The contents of this e-mail and any attachments are confidential and may
be legally privileged. If you have received this e-mail and you are not
a named addressee, please inform us as soon as possible on
+44 118 901 2999 and then delete the e-mail from your system. If you are
not a named addressee you must not copy, use, disclose, distribute,
print or rely on this e-mail. Any views expressed in this e-mail or any
attachments may not necessarily reflect those of Tao's management.
Although we routinely screen for viruses, addressees should scan this
e-mail and any attachments for viruses. Tao makes no representation or
warranty as to the absence of viruses in this e-mail or any attachments.
Please note that for the protection of our business, we may monitor and
read e-mails sent to and from our server(s).

Visit our website at http://tao-group.com/
