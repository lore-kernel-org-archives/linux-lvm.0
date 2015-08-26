Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QCMFrw020738
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 26 Aug 2015 08:22:16 -0400
Received: from mail.shockmedia.nl (mail.shockmedia.nl [31.7.4.4])
	by mx1.redhat.com (Postfix) with ESMTPS id A8C5415775B
	for <linux-lvm@redhat.com>; Wed, 26 Aug 2015 12:22:12 +0000 (UTC)
Received: from office.shockmedia.nl ([31.7.3.253] helo=[192.168.8.179])
	by mail.shockmedia.nl with esmtpsa
	(TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128) (Exim 4.82)
	(envelope-from <bram@shockmedia.nl>) id 1ZUZiU-0002PI-Oh
	for linux-lvm@redhat.com; Wed, 26 Aug 2015 14:22:10 +0200
Message-ID: <55DDAF71.5080307@shockmedia.nl>
Date: Wed, 26 Aug 2015 14:22:09 +0200
From: Bram Klein Gunnewiek <bram@shockmedia.nl>
MIME-Version: 1.0
References: <55DC3EBF.4030703@shockmedia.nl> <55DD9C1C.9070105@redhat.com>
In-Reply-To: <55DD9C1C.9070105@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots on clustered LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 08/26/2015 12:59 PM, Zdenek Kabelac wrote:
> Dne 25.8.2015 v 12:09 Bram Klein Gunnewiek napsal(a):
>> Currently we are using LVM as backing storage for our DRBD disks in HA
>> set-ups. We use QEMU instances on our node's using (local) DRBD 
>> targets for
>> storage. This enables us to do live migrations between the DRBD
>> primary/secondary nodes.
>>
>> We want to support iSCSI targergets in our HA enviroment. We are 
>> trying to see
>> if we can use (c)lvm for that by creating a volume group of our iSCSI 
>> block
>> devices and use that volume group on all nodes to create logical 
>> volumes. This
>> seems to work fine if we handle locking etc properly and make sure we 
>> only
>> activate the logical volumes on one node at a time. As long as we 
>> only have a
>> volume active on one node snapshots seem to work fine also.
>>
>> However, we run into problems when we want to perform a live 
>> migration of a
>> running QEMU instance. In order to do a live migration we have to 
>> start a
>> second similar QEMU on the node we want to migrate to and start a 
>> QEMU live
>> migration. In order for us to do that we have to make the logical volume
>> active on the target node otherwise we can't start the QEMU instance. 
>> During
>> the live migration QEMU ensures that data is only written on one node 
>> (e.g.
>> during the live migration data will be written on the source node, 
>> QEMU wil
>> then pause the instance for a short while when copying the last data 
>> and will
>> then continue the instance on the target node).
>>
>> This use case works fine with a clustered LVM set-up except for 
>> snapshots.
>> Changes are not saved in the snapshot when the logical volume is 
>> active on
>> both nodes (as expected if the manual is correct:
>> https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/5/html-single/Logical_Volume_Manager_Administration/#snapshot_volumes). 
>>
>>
>>
>> If we are correct it means we can use lvm for as clustered "file 
>> system" but
>> can't trust our snapshots to be 100% reliable if a volume group has 
>> been made
>> active on more then one node. E.G. when doing a live migration 
>> between two
>> nodes of a QEMU instance our snapshots become unreliable.
>>
>> Are these conclusions correct? Is there a solution for this problem 
>> or is this
>> simply a known limitation of clustered lvm without a work-around?
>
> Yes - snapshots are supported ONLY for exclusively actived volumes 
> (means LV with snapshot is active only on a single node in cluster).
>
> There is no dm target which would support clustered usage of snapshots.
>
> Zdenek
>

Thanks for the confirmation. It's a pitty we can't get this done with 
LVM ... we will try to find an alternative.

Out of curiosity, how does a node know the volume is opened at another 
node? In our test set-up we don't use CLVM or anything (we are just 
testing), so there is no communication between the nodes. Is this done 
through meta data in the volume group / logical volume?
