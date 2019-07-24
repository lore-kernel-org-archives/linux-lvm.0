References: <CH2PR18MB3206CB2E1FB879E424FCA2BACFF00@CH2PR18MB3206.namprd18.prod.outlook.com>
	<c6f91be7-fc45-3233-315d-70e1bc8eb9cc@redhat.com>
	<CH2PR18MB32067BD6FBA17E47168C2597CFF30@CH2PR18MB3206.namprd18.prod.outlook.com>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <0ea0d9f7-3b39-7172-78e8-59ae53592d6d@redhat.com>
Date: Wed, 24 Jul 2019 15:43:40 +0200
MIME-Version: 1.0
In-Reply-To: <CH2PR18MB32067BD6FBA17E47168C2597CFF30@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Which lvm2 code branches are important?
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <GHe@suse.com>

On 7/11/19 4:25 AM, Gang He wrote:
> Hello Marian,
> 
> Thank for your reply.
> About the detailed changes for V2.03, where do we can find the related documents from the external link?

If by that you mean WHATS_NEW{,_DM} files, these were overwritten every 
time by latest 2.02 or 2.03 release.

I have fixed that now, and there are now both files for 2.02 and 2.03 
available on sourceware.org:

ftp://sources.redhat.com/pub/lvm2/WHATS_NEW-2.02
ftp://sources.redhat.com/pub/lvm2/WHATS_NEW_DM-2.02

ftp://sources.redhat.com/pub/lvm2/WHATS_NEW-2.03
ftp://sources.redhat.com/pub/lvm2/WHATS_NEW_DM-2.03

WHATS_NEW is now a link to the newest branch (2.03 ATM):

ftp://sources.redhat.com/pub/lvm2/WHATS_NEW
ftp://sources.redhat.com/pub/lvm2/WHATS_NEW_DM

-- Marian


> 
> Thanks
> Gang
> 
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Marian Csontos
> Sent: 2019��7��10�� 20:48
> To: LVM general discussion and development <linux-lvm@redhat.com>; Gang He <GHe@suse.com>
> Subject: Re: [linux-lvm] Which lvm2 code branches are important?
> 
> On 7/10/19 8:42 AM, Gang He wrote:
>> Hello List,
>>
>> After you clone the code from git://sourceware.org/git/lvm2.git, you can find lots of remote code branches.
>> But which code branches are important for the third party users/ developer? That means we should monitor these code branches.
>> For example,
>> Which code branches are main (or long-active) code branches?
>> Which code branches are used for which lvm2 products (big versions)?
> 
> master - 2.03 branch, new features land here,
> stable-2.02 - legacy 2.02 branch, bug fixes mostly.
> 
>> What are the main differences between different lvm2 products? E.g. some features are added/removed.
> 
> 2.03 vs 2.03:
> 
> - dropped lvmetad and clvmd,
> - added handling of writecache and VDO targets.
> 
>>
>>
>> Thanks a lot.
>> Gang
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
