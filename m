From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Re: Recovering from disk failure
Message-ID: <20030828213519.D14441@uk.sistina.com>
References: <yw1xwucyty8b.fsf@users.sourceforge.net> <20030828132053.C14441@uk.sistina.com> <yw1xy8xdlin0.fsf@users.sourceforge.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yw1xy8xdlin0.fsf@users.sourceforge.net>; from mru@users.sourceforge.net on Thu, Aug 28, 2003 at 08:52:19PM +0200
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
Date: Fri Aug 29 07:09:08 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Aug 28, 2003 at 08:52:19PM +0200, M?ns Rullg?rd wrote:
> --partial option, it won't let me see them at all.  
Should do, if you create /dev/ioerror with dmsetup as a device
bigger than the device you lost.

e.g.

cat > tab1 << EOF
0 10000000 error
EOF

dmsetup create ioerror tab1
ln -s /dev/mapper/tab1 /dev/ioerror

Replace the 10000000 with a number slightly bigger than the 
size of your problem disk in sectors.   [device size in bytes / 512]


[Need to bring dmsetup(8) up-to-date.]


Alasdair
-- 
agk@uk.sistina.com
