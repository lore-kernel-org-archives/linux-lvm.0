Message-ID: <3E5BF188.6000207@stamppot.demon.nl>
From: Sander Alberink <alberink@stamppot.demon.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Severe problem: data lost while adding a partition
References: <3E3C62E4.7030409@home.nl> <20030203113148.B8501@sistina.com> <3E42D82B.3070003@stamppot.demon.nl> <20030207152736.C27442@sistina.com> <3E515E16.8050209@stamppot.demon.nl> <264070000.1045520730@[192.168.200.4]>
In-Reply-To: <264070000.1045520730@[192.168.200.4]>
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
Date: Tue Feb 25 16:43:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi all,

Thanks for the reply. At the moment I have re-initialized the PV's via 
pvcreate -ff. However, trying to reconstruct a new volume group yields 
me the following output:

# vgcreate -v home /dev/hda[1,4,6,7]
vgcreate -- checking volume group name
vgcreate -- checking volume group directory existence
vgcreate -- locking logical volume manager
vgcreate -- checking volume group "home" existence
vgcreate -- counting all existing volume groups
vgcreate -- reading all physical volume data from disks
vgcreate -- checking if all given physical volumes in command line are new
vgcreate -- checking physical volumes name "/dev/hda1"
vgcreate -- checking physical volumes name "/dev/hda4"
vgcreate -- checking physical volumes name "/dev/hda6"
vgcreate -- checking physical volumes name "/dev/hda7"
vgcreate -- no valid physical volumes in command line
#

So apparently something is not OK. But what can that be? Any pointers 
would be appreciated!

>> I really appreciate your help in this. However, I am rather reluctant to
>> dive in and be hasty in my commands. I really don't want to destroy my
>> data.... As I understand it, pvcreate -ff would re-initialize the
>> physical volume. As I understand it, I will have to add them to a volume
>> group again. But will the filesystem still be intact after that then?
>>
>> Sorry if this sound like a beginner question to you. It very well might
>> be, but I'd rather be careful....
>
>
> Thing to understand is that LVM commands update a small
> header on the phyiscal volume. You can munge the LVM
> portion without touching your data at all. In this case
> the data has no way of knowing that anything happend to
> the LVM portion of life: they live in entirely different
> parts of the disk drive. 


Best regards,

Sander Alberink
