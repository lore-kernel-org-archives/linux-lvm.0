From: "Jan H. van Gils" <JanVG@Knoware.NL>
Subject: RE: [linux-lvm] Debian and LVM at the begin of the installation prozess
Message-ID: <000d01c2eb9d$14f15bb0$240b892c@pe1mhp.ampr.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1047802522.3e74329ad4102@secure.st-peter.stw.uni-erlangen.de>
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
Date: Sun Mar 16 03:19:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

>Quoting Stefan Feeser <stefan.feeser@felino.de>:
>
>> Hi all,
>> 

	Hi,

>> I am a beginner with LVM and Debian. I would like to install debian 
>> and "put" the hole disks in the LVM. At my system I would like to 
>> stripe-mirror (RAID
>> 10) my two disks (IDE). Because the hardware is not the newest one I
>> have to 
>> do the installation with bootdisks.
>> 
>> My question is how I can create a volume group and so on during the
>> installation prozess.
>> 
>> I have tested this but Debian always present his installation tool. I
>> downloaded debian installation disks and the device drivers 
>but I always
>> see 
>> the installation tool. After that the next steps will be to 
>configure 
>> language, etc., and, after that I have to create a swap partition and
>> than an 
>> root partition. A LVM filesystem I can't create.
>> 


Don't put / (root) on a logical Volume when using debian !

The kernels from debian package manager apt use the cramfs file system
for initrd.
When this is mounted during boot LVM can't write lvmtab on /etc because
The cramfs is a read-only filesystem.

Only when you rebuild the kernel, and don't use the kernels in the
package
manager you can make sure the initrd supports ext2 during boot.


>> Sorry about my, I am sure, stupid questions and my bad english.
>> 
>> Thanks and regards
>> 
>> Stefan

Good luck Jan

----
With regards Jan H. van Gils
Internet web-page http://www.Knoware.NL/users/janvg/
Internet e-mail address JanVG@Knoware.NL
RIPE Whois JHG5-RIPE, 6BONE Whois JHG1-6BONE
