Message-ID: <20040107065801.A27995@cs.mcgill.ca>
From: Navindra Umanee <navindra@cs.mcgill.ca>
Mime-Version: 1.0
Subject: [linux-lvm] setting VG UUID
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
Date: Wed Jan  7 06:00:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi!

After figuring out that my all my PVs were lacking UUIDs, I used this
hack from Heinz to correct the situation:

http://lists.sistina.com/pipermail/linux-lvm/2002-January/010521.html

(Alasdair also kindly provided a patch to handle the situation in LVM2.)

Now my VG itself is still lacking a UUID and this causes problems such
as vgcfgrestore refusing to continue.  Is there any way I can update
my VG UUID?

I also have this problem where my PV's are using different system ids:

VG:        localhost.localdomain1073237462
/dev/hda6: localhost.localdomain1073237462 (same)
/dev/hda7: localhost.localdomain1073237466
/dev/hda8: localhost.localdomain1073237470
/dev/hda9: localhost.localdomain1073237474

Is there a way of fixing this?

Thanks,
Navin.
