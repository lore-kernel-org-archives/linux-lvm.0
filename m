Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8594A619B4
	for <linux-lvm@redhat.com>; Tue,  9 Apr 2019 13:33:50 +0000 (UTC)
Received: from mtaextp1.scidom.de (mtaextp1.scidom.de [146.107.103.20])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B2D830024AD
	for <linux-lvm@redhat.com>; Tue,  9 Apr 2019 13:33:48 +0000 (UTC)
Date: Tue, 9 Apr 2019 15:33:44 +0200 (CEST)
From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Message-ID: <1403833968.422177.1554816824853.JavaMail.zimbra@helmholtz-muenchen.de>
In-Reply-To: <6d88edff-8ec2-7724-04c2-9909f2013d29@gmail.com>
References: <1674381816.392064.1554814805982.JavaMail.zimbra@helmholtz-muenchen.de>
	<6d88edff-8ec2-7724-04c2-9909f2013d29@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] can't remove snapshot
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
Content-Type: text/plain; charset="us-ascii"
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: "LVM Mailingliste, (RedHat)" <linux-lvm@redhat.com>



----- On Apr 9, 2019, at 3:24 PM, Zdenek Kabelac zdenek.kabelac@gmail.com wrote:

> Dne 09. 04. 19 v 15:00 Lentes, Bernd napsal(a):
>> Hello list,
>> 
>> I have a two-node HA-cluster which uses local and cluster LVM.
>> cLVM is currently stopped, I try to remove a snapshot from the root lv which
>> is located on a local VG.
>> I get this error:
>> ha-idg-2:/mnt/spp # lvremove -fv vg_local/lv_snap_pre_sp4
>>    connect() failed on local socket: No such file or directory
>>    Internal cluster locking initialisation failed.
>>    WARNING: Falling back to local file-based locking.
>>    Volume Groups with the clustered attribute will be inaccessible.
>>      Archiving volume group "vg_local" metadata (seqno 26).
>>      Removing snapshot volume vg_local/lv_snap_pre_sp4.
>>      Loading table for vg_local-lv_root (254:8).
>>    device-mapper: reload ioctl on  (254:8) failed: Invalid argument
>>    Failed to refresh lv_root without snapshot.
>> 
> 
> Hi
> 
> Have you tried to converted clustered VG to be a non-clustered one ?
No. What would be the reason to do this ?

> And use file locking to proceed with operation on local device?
No. How can i do that ?


Bernd
 

Helmholtz Zentrum Muenchen
Deutsches Forschungszentrum fuer Gesundheit und Umwelt (GmbH)
Ingolstaedter Landstr. 1
85764 Neuherberg
www.helmholtz-muenchen.de
Stellv. Aufsichtsratsvorsitzender: MinDirig. Dr. Manfred Wolter
Geschaeftsfuehrung: Prof. Dr. med. Dr. h.c. Matthias Tschoep, Heinrich Bassler, Kerstin Guenther
Registergericht: Amtsgericht Muenchen HRB 6466
USt-IdNr: DE 129521671
