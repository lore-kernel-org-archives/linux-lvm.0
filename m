Message-ID: <3FE36579.8090605@alteeve.com>
From: Madison Kelly <linux@alteeve.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Ext3 -> ReiserFS on '/' convertion prob
References: <3FE2892B.8000506@alteeve.com>	 <1071846372.22613.2.camel@gecko.indygecko.com>	 <3FE32D1A.6040500@alteeve.com> <1071857908.22615.13.camel@gecko.indygecko.com> <3FE357AA.6090305@alteeve.com> <3FE36341.5070105@stercomm.com>
In-Reply-To: <3FE36341.5070105@stercomm.com>
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
Date: Fri Dec 19 14:54:07 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I am so sorry for asking but how would I check?

Madison

Chris Cox wrote:
> Madison Kelly wrote:
> ...
> 
>>
>> Is there an LV, LVM, VG or PV command I need to issue to tell the 
>> system that the filesystem is now resierfs? As I mentioned, I have 
>> edited '/etc/fstab', '/etc/mtab' and '/etc/blkid.tab' to reflect the 
>> changes. What am I missing? Gah! I feel like I am so close yet so far!
> 
> 
> Is reiserfs being loaded in by your initrd?
