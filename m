From: Petro <petro@auctionwatch.com>
Message-ID: <20011214191634.GB24486@auctionwatch.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] invalidate: busy buffer
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
Date: Fri Dec 14 13:14:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Setup: 4 IBM drives attached to a 3ware raid card (64xx), in a raid 0
configuration, as /dev/sdb. 

Trying to set up LVM on it, run vgscan and get: 

vgscan -- reading all physical volumes (this may take a while...)
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group


Is this a warning from LVM? If so, what does it mean (and if not, if
anyone does know what it means, I'd be really glad to find out). 

thanks.


-- 
Share and Enjoy. 
