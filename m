Message-ID: <3D9F6C62.1040004@raffael.ch>
From: Raffael Herzog <herzog@raffael.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to fix inconsistent LV structs?
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
Date: Sat Oct  5 17:48:59 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi,

After a normal reboot I lost my volumes. I don't know, what
exatly happended, but it looks like there was some problem
with AVFS that caused umount not to work properly. I turned
AVFS off now, but this doesn't get me my LVs back.

pvdata shows me, that the logical volume structs 125 through
139 are inconsistent (there are no LVs there), at some later
point, it segfaults. Debug output showed me, that there's
some garbage in these logical volume structs.

My basic idea is to just clear these structs and then use
vgcfgrestore and/or the other recovery tools (which current-
ly all fail with "pv_read(): read") to restore my LVs.

But how do I clear these structs?


TIA,

   Raffi
