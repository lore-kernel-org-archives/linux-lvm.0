From: Duane Evenson <devenson@shaw.ca>
Subject: Re: [linux-lvm] help on PV
Message-id: <3EE9DD31.9080605@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
References: 
 <23233866A70C32479532C8D0B8AE7B96025D72F7@i2km07-ukbr.domain1.systemhost.net>
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
Date: Fri Jun 13 09:14:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

You will lose all the data on your 80G hard drive. This is because an 
LVM drive pushes the filesystem back further on the drive to make space 
for the PV, VG, and LV metadata.

You could move 40G of data to the new drive. Reduce the size of the 
filesystem on your 80G by 40G. Repartition the drive to 2 40G 
partitions. make the second partition a LVM partition. Move the 
remaining data from the first 40G onto the second and make the first 
partion an LVM partition.
LVM will see all these partitions and drives as one so the number of 
partitions won't matter.

Actually, if you have almost 80G or more now, you'll have to partition 
the 80G hard drive into 3 partitions instead of 2, but the procedure is 
similar.

narsimha.kulkarni@bt.com wrote:

>Hi,
>
>I had a 8GB disk on which the / was configured.
>
>Then I added another 40GB disk which I configured under LVM.
>
>Now I want to add the 8GB also as a logical disk to the volume group in
>which the 40GB.
>
>If I do a pvcreate on the 8GB, will I lose all the data on / or just
>pvcreate and extend it.
>
>Narsimha
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>  
>
