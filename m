Message-ID: <3F66F958.4050301@webhackande.se>
From: Rickard Olsson <richie@webhackande.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM1 and a dying disk (fixed)
References: <3F55ABF8.40608@webhackande.se> <20030903111442.C2618@sistina.com> <3F55C7F7.1090305@webhackande.se> <20030903143730.D2618@sistina.com>
In-Reply-To: <20030903143730.D2618@sistina.com>
Content-Transfer-Encoding: 7bit
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
Date: Tue Sep 16 06:54:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

# vgchange -ay
vgchange -- volume group "files_vg" successfully activated


I had a duplicate PV uuid for some reason.

The LVM2 vgcfgrestore didn't like the old LVM1 metadata format and 
LVM2's vgconvert said files_vg doesn't exist. Catch 22. Combining the -u 
switch in LVM2's pvcreate with a regular pvcreate and vgcfgrestore in 
LVM1 finally solved that.

Very, very scary. Now to see if reiserfsck's --rebuild_tree works. :-)

    / Rickard Olsson,IT-Konsult/
   / Telefon: +46 70 635 01 42/
  / http://www.webhackande.se/
