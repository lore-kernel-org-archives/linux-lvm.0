Subject: Re: [linux-lvm] filesystem does not reflect new LV size
Message-ID: <20020606165925.GA8756@fib011235813.fsnet.co.uk>
References: <200206061638.g56GcYr19414@bach.leonora.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200206061638.g56GcYr19414@bach.leonora.org>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Thu Jun  6 12:00:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Resizing is always done in two steps, these steps are done in a
different order depending whether you are extending or reducing.

Extending:

i) Resize the LV (lvextend)
ii) Resize the filesystem (eg, ext2resize, resize_reiserfs)

Reducing:

i) Resize filesystem.
ii) Resize the LV (lvreduce)


There is a tool called e2fsadm provided in LVM1 which performs both of
these steps iff you are using an ext2 filesystem.

- Joe
