From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM2 and I2O block devices
Message-ID: <20030111222226.A12037@uk.sistina.com>
References: <1042317678.3e20816ec835e@mail.serviceweb.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1042317678.3e20816ec835e@mail.serviceweb.net>; from tlove@serviceweb.net on Sat, Jan 11, 2003 at 03:41:18PM -0500
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
Date: Sat Jan 11 16:21:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Jan 11, 2003 at 03:41:18PM -0500, tlove@serviceweb.net wrote:
> I've been scouring the lists for information on getting LVM to recognize my 
> hardware RAID I2O black device.  

> and I have tried monkeying with the filters in the .conf file.  Any 
Try adding a "types = " line corresponding to what appears in /proc/devices 
- see doc/example.conf & man 5 lvm.conf.

Alasdair
-- 
agk@uk.sistina.com
