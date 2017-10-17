Date: Tue, 17 Oct 2017 11:54:56 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20171017165456.GA22423@redhat.com>
References: <DB6PR0902MB2213A3709365A8B5F151390C954B0@DB6PR0902MB2213.eurprd09.prod.outlook.com>
	<20171013144111.GA2570@redhat.com>
	<DB6PR0902MB2213F527A2A5C02317218F72954F0@DB6PR0902MB2213.eurprd09.prod.outlook.com>
	<20171016185429.GA26267@redhat.com>
	<DB6PR0902MB221318644207A1CB3E40EA74954F0@DB6PR0902MB2213.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DB6PR0902MB221318644207A1CB3E40EA74954F0@DB6PR0902MB2213.eurprd09.prod.outlook.com>
Subject: Re: [linux-lvm] add_lockspace done -19
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Moshe Lazarov <Moshe.Lazarov@axxana.com>

It looks like you have a permission problem.  The sanlock daemon needs to
be able to use /dev/mapper/global-lvmlockd, but in your case it is getting
an EACCES error when it tries to use that device.

Check what UID/GID the sanlock daemon is running as, and that this GID is
allowed to access disks.  The sanlock daemon by default will try to run
with UID/GID of sanlock/sanlock.  I have things set up like this to allow
that (the sanlock rpm will typically set this up for you):

$ cat /etc/passwd | grep sanlock
sanlock:x:179:179:sanlock:/var/run/sanlock:/sbin/nologin

$ cat /etc/group | grep sanlock
disk:x:6:sanlock
tape:x:33:sanlock
sanlock:x:179:

You could also configure sanlock to run as root and not bother with the
user/group setup.  Set "uname = root" and "gname = root" in
/etc/sanlock/sanlock.conf.

Dave
