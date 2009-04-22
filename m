Received: from glen-mhor.englab.brq.redhat.com
	(glen-mhor.englab.brq.redhat.com [10.34.32.149])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n3M6adO7020947
	for <linux-lvm@redhat.com>; Wed, 22 Apr 2009 02:36:40 -0400
Message-ID: <49EEBAF7.5070903@redhat.com>
Date: Wed, 22 Apr 2009 08:36:39 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] RE: using lvm mirroring in clusters
References: <0KHQ00HDXFTAD910@comexp1-srv.lux.eib.org>
In-Reply-To: <0KHQ00HDXFTAD910@comexp1-srv.lux.eib.org>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

AZZOPARDI Konrad wrote:
>  Hi list,
>
> I am quite new to RedHAt clustering and I am experimenting with RedHat 5.3. I read that LVM mirrors are now supported in cluster mode. At our work place we have two datacentres and each DC has an HDS SAN. The idea is that I put two cluster nodes in each DC and each node will be presented with two multipathed block devices say /dev/dm-5 and /dev/dm-6. How can I create 2 mirrored LVs out of a volume group {comprising the two devices} and assuring that the mirrors are spread between the two devices {to give me the assurance that if one DC is down, data is available in the other device}
>
> Thanks
> konrad
>
> --------------------------------------------------------------------
>
> Les informations contenues dans ce message et/ou ses annexes sont 
> reservees a l'attention et a l'utilisation de leur destinataire et peuvent etre 
> confidentielles. Si vous n'etes pas destinataire de ce message, vous etes 
> informes que vous l'avez recu par erreur et que toute utilisation en est 
> interdite. Dans ce cas, vous etes pries de le detruire et d'en informer la 
> Banque Europeenne d'Investissement.
>
> The information in this message and/or attachments is intended solely for 
> the attention and use of the named addressee and may be confidential. If 
> you are not the intended recipient, you are hereby notified that you have 
> received this transmittal in error and that any use of it is prohibited. In 
> such a case please delete this message and kindly notify the European 
> Investment Bank accordingly.
> --------------------------------------------------------------------
>  
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>   
Hi Konrad,
it is as simple as:
# lvcreate -L $SIZE -m1 -n $LV $VG $PV1 $PV2 ...

The "$PV1 $PV2" part does the trick.

See man lvcreate and search the web for details.

-- Marian
