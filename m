Message-Id: <5.1.1.6.2.20021003172132.01df4738@pop.tvnet.hu>
From: Newsmail <newsmail@satimex.tvnet.hu>
Mime-Version: 1.0
Subject: [linux-lvm] remove a drive from an array not like described in the howto
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
Date: Thu Oct  3 10:32:21 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I would like to remove a HD from my VG, but the VG contains an LV, that 
uses the entire space of the VG. the howto describes I have to pvmove 
everything from my HD I want to remove to another physical volume in the 
VG. well I have no other physical volume for this purpose.
is this a good way to resize my partition with resize_reiserfs, and then 
lvreduce my LV, then vgreduce the physical volume from it? is this a good 
way to not loose my data?
regards,
greg
