From: Jesse Keating <jkeating@pogolinux.com>
Subject: Re: [linux-lvm] Sharing LVM's via NFS on Redhat 8.0
References: <F66Jmn8eeGbdBmM9SJL000066dc@hotmail.com> <20030221082208.GA1810@tykepenguin.com>
In-Reply-To: <20030221082208.GA1810@tykepenguin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200302210807.52133.jkeating@pogolinux.com>
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
Date: Fri Feb 21 10:06:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Friday 21 February 2003 00:22, Patrick Caulfield uttered:
> Sharing over NFS is fine. What you are doing with NFS is sharing the
> filesystem. The dangerous behaviour mentioned is when you are sharing the
> actual block device that is the LV. A subtle but very important
> distinction.

If you want to share the actual block devices, look into HyperSCSI.  It allows 
you to "share" out your block devices, and clients can access them as local 
SCSI interfaces.  2 clients can access the same LVM group concurrently, just 
as if they were both on the same system.

http://nst.dsi.a-star.edu.sg/mcsa/hyperscsi/index.html <-- hyperscsi's home

http://geek.j2solutions.net/stuff/HyperSCSI <-- A test case I ran through 
yesterday.

-- 
Jesse Keating RHCE MCSE
Pogo Linux -- Support Tech
tel: 888.828.7646
