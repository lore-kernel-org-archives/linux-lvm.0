Date: Fri, 30 Jun 2000 11:34:18 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Message-ID: <20000630113418.A8639@gondor.com>
References: <8525690D.0082015B.00@d54mta02.raleigh.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8525690D.0082015B.00@d54mta02.raleigh.ibm.com>; from benr@us.ibm.com on Thu, Jun 29, 2000 at 06:39:51PM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benr@us.ibm.com
Cc: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>, linux-lvm@msede.com

On Thu, Jun 29, 2000 at 06:39:51PM -0500, benr@us.ibm.com wrote:
> If you are using ext2, then you could use e2fsadm, but if you are using
> another filesystem, then what?  Even if you are using ext2, a user could
> still use lvreduce directly.  Thus, this is a data security hole.

We'll always have that kind of 'data security hole'. We have lvreduce, we
have mke2fs, we even have cat /dev/zero >/dev/hda. 

I think admin tools should be easily usable, and that includes safety. It
should be difficult to destroy data accidently. So, obviously, it's a bad
thing if you have to shrink the fs size first, then shrink the volume size,
and if you misstype one of the sizes you lose data.

I see two possible solutions: One is an integrated tool like e2fsadm,
generalized to know about all possible filesystems. (If you call it to
shrink a fs that it doesn't know about, it fails with a proper error
message).

The second is a check in lvreduce to ensure the fs on the partition fits into
the new volume size. The user still has to call ext2resize (or another tool)
first, and then lvreduce, but user faults are caught. 

(Of course, lvreduce will have a --i-know-this-doesnt-fit-do-it-anyway option
to allow the admin to shoot himself in the foot if he really wants to...)


I know the proposed LVMS does much more than providing data security, but I'm
just not interested in many of the features, so I don't comment on them. What
I like about LVM (and I think I share this opinion with many other people) is
the ability to change partition sizes without big data moving tasks, and
without the need to care about drive borders.
And I know about the dangers of lvreduce, it did already bite me once. :-)

Jan
