From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Swap on LVM - swapoff problem - more info
Message-ID: <20030409123754.A476@uk.sistina.com>
References: <1049881311.8416.142.camel@ariel>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1049881311.8416.142.camel@ariel>; from george.karaolides@planitis.net on Wed, Apr 09, 2003 at 12:41:51PM +0300
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
Date: Wed Apr  9 06:38:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: debian-user@lists.debian.org

On Wed, Apr 09, 2003 at 12:41:51PM +0300, George Karaolides wrote:
> The problem is caused by running vgscan while swap is active on the LVM
> device (not necessarily actually using swap space; just active).  

> I modified the "start" case of the lvm init script to run swapoff before
> running vgscan, and swapon after.

If you really want to experiment with swap on an LVM volume (why?) you 
should resequence your startup so that vgscan gets run *after* /etc
is mounted but *before* setting up swap.

It's rather late running vgscan after you've *already* started up LVM.
vgscan should be run to detect LVM-related disk configuration changes
*before* using LVM proper.

Alasdair
-- 
agk@uk.sistina.com
