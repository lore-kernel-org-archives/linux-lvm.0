Message-ID: <3FEAFF9D.9020602@netscape.net>
From: John Craig <johncraig01@netscape.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LV > 2 TB ???
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
Date: Thu Dec 25 09:19:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi,

I asked this question on the SuSE lists, but never got a clear answer. I 
am running an AMD Opteron system, with the 64-bit 2.4.21-149-smp kernel 
and  LVM 1.0.7(mp-v6). I have a volume group of 3 RAID arrays, totalling 
2.7 TB, but I cannot create a single LV of more than 2 TB. We intend to 
grow the  storage well beyond the current size, so this is not an 
academic question.

1. I read that there is a 2 TB block device limit imposed by the kernel 
on _32-bit hardware_, but this does not have to apply to 64-bit 
hardware, if so, can I set a kernel parameter to ease that restriction?

2. Is there a setting in LVM that imposes the 2 TB limit on LVs?

3. Will these restrictions go away with the 2.6 kernel, and LVM2?

4. What advantages would I get to moving to Sistina's GFS instead of LVM 
1/2?

Thanks,

John Craig
