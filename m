Return-Path: <c.brunnkvist@speednames.com>
Message-ID: <909EA7234316394F80BBB70A85A1EB389607D9@hermes.dimac.net>
From: "Conny Brunnkvist / dimac.net" <c.brunnkvist@speednames.com>
Date: Tue, 26 Jun 2001 09:55:10 +0200
MIME-Version: 1.0
Subject: [linux-lvm] lvm_chr_ioctl / unable to activate vg
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hello everyone. After searching around a bit in the list-archives, I still
can't figure out exactly how to advance.. This is my problem: 
I was running kernel 2.4.3 (stock) and LVM tools some-earlier-version than
0.9.1_beta6.. I recently switched to kernel 2.4.4 because I heard that it
contained lots of LVM and ReiserFS(my FS of choice) related fixes. 
In the same swing, I also installed the LVM tools from the latest packages
for slackware, 0.9.1_beta6.

After rebooting into 2.4.4, the volume group wouldn't activate, so I
switched back to 2.4.3 but now it didn't work there either! Got exactly the
same error message: 

# vgchange -v -ay
vgchange -- locking logical volume manager
vgchange -- finding all volume group(s)
vgchange -- checking volume group name "vg0"
vgchange -- checking existence of volume group "vg0"
vgchange -- reading volume group data for "vg0" from lvmtab
vgchange -- checking volume group consistency of "vg0"
vgchange -- checking if all physical volumes of volume group "vg0" are
available
vgchange -- creating VGDA for "vg0" in kernel
lvm -- lvm_chr_ioctl: unknown command 4004fe0a
vgchange -- ERROR "Invalid argument" activating volume group "vg0"

vgchange -- unlocking logical volume manager


So, I speculate it has to do with the change of userland tools versions...
Too bad I just can't remember which version I ran before the reboot... 

Any help on what I should do to get it up and running again would be
appreciated. I really don't want to loose any data! :-F

//conny
