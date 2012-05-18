Message-ID: <4FB61CED.6000309@redhat.com>
Date: Fri, 18 May 2012 10:57:01 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <CAGQjrKb6_HuVc2Ro8vnkMwEmHg-H4gJHJVf_Q5GVaZfSM1p7yA@mail.gmail.com>
In-Reply-To: <CAGQjrKb6_HuVc2Ro8vnkMwEmHg-H4gJHJVf_Q5GVaZfSM1p7yA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvreduce nightmare
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: tariq wali <ganaiwali@gmail.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/16/2012 04:48 PM, tariq wali wrote:
> Filesystem                       Size  Used Avail   Use% Mounted
> on /dev/mapper/vg0-data         2.2T  1.7T  433G  80%  /data
> 
> Out of the available *433G* I wanted to reduce *100G* in vg0 so
> that I could use it for a new partition and this is what I did ..
> 
> * e2fsck -f /dev/vg0/data resize2fs /dev/vg0/data 100G

This command will attempt to reduce the file system to 1OOG *total*.
It could not have succeeded given the file system state shown by df above.

> lvreduce -L -100G -n /dev/vg0/data*

This truncated the last 100G of the file system. Immediately stopping
at this point, restoring LVM metadata and fscking would have fixed this.

> *e2fsck -f /dev/vg0/data -n* * * after the fsck completed it would
> prompt to fix superblock/inodes which I replied with 'yes' however
> the problem still persists that if i mount /data it goes into
> read-only mode .

With -n the fsck should not write to the disk but if it was prompting
you for y/n to fixes then it probably was not run with that option.

> I have reduced lvm's with those  sequence of commands in the past
> but i just dont understand why it seems to have failed this time
> although i did get 100G free space in vg0 but the partition /data
> seems useless ..

The resize2fs invocation used was incorrect and probably failed
causing the subsequent device resize to truncate the file system. The
fsck then trashed what was left while trying to fix it.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+2HOwACgkQ6YSQoMYUY94EJACgqZXdY+xM9nnYzWB2yfUzYrSl
VfUAoJe0I0e84iy22Riapx818DkHfRgb
=ADc8
-----END PGP SIGNATURE-----
