From: "William Blunn" <bill+f.20020524@tao-group.com>
Subject: Re: [linux-lvm] getting started with LVM
Message-ID: <NBBBKNGPDGBANKFPOHCNKEKJGHAA.bill+f.20020524@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3CED5725.8070006@jumpline.com>
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
Date: Fri May 24 04:02:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Something I probably should have mentioned....due to some software we=20
> use to serve our customers, we have hard links - TONS of them.  We=20
> looked at cpio, but cpio does not restore hardlinks correctly, dump=20
> will.  We also looked at tar, 'star', dd, just about anything to take=20
> the data from one device/filesystem to another.

To copy data from one filesystem another, preserving hard links, I use:

  rsync  -avxSHW  /source-dir/  /target-dir

  -a   same meaning as for "cp" i.e. recurse and copy metadata
  -v   be verbose
  -x   do not cross filesystem boundaries
  -S   handle sparse files
  -H   handle hard links
  -W   only copy whole files

  Trailing slash on source-dir makes it copy *contents* of directory
  rather than directory itself.

It only copies changed changed files.

Be sure to use version 2.5.2 or higher of rsync.

Bill
--=20
William H. Blunn - <bill+s.mq8r0gra@tao-group.com> - Developer Support
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

Visit our website at http://tao-group.com/
