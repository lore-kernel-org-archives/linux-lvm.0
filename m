From: "William Blunn" <bill+f.9sfuw6uo@tao-group.com>
Subject: Re: [linux-lvm] Is it possible to change the PE size on a live volume?
Message-ID: <BDEMIPDEGABMNEFIHCPDIEHGEBAA.bill+f.9sfuw6uo@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20021021194052.B8228@superfly.archi-me-des.de>
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
Date: Mon Oct 21 13:22:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Greetings. My volume is 225 GB in size and getting too small.
> Unfortunately, I used the default PE size when creating the volume
> group. Is there any way I can overcome the 256 GB limit ...

In the LVM 1.0.x series,

Given the sizes of modern hard disk arrays,
maybe the default PE/LE size should be changed from 4 MiB to 16 MiB,
in the LVM 1.0.x series.

My feeling is that more people's needs would fit into 1 TiB than fit
into 256 GiB.

Perhaps a few people with small hard disks might complain: "I made an VG
and it used the default PE/LE size of 16 MiB. The granularity is too
coarse. Is there any way I can reduce the PE/LE size?"

Of course I don't think many people would ever make this complaint, and
even if they did, it would be because their disk arrays were small, say
less than 500 MiB. Then it would be easier to give them the bad news
(take your data off onto a temporary area, or buy another hard disk),
because their total data is less.

i.e. it shifts the problems from the people with big problems to the
people with small problems.

Regards,

the "peeling-back-a-layer" department

--=20
William H. Blunn - <bill+s.9sfuw6uo@tao-group.com> - Developer Support
Tao
62/63 Suttons Business Park, Earley, READING, RG6 1AZ, United Kingdom
Tel: +44 118 901 2999 - Fax: +44 118 901 2963 - http://tao-group.com/

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
