From: Heming Zhao <heming.zhao@suse.com>
Date: Fri, 14 Jun 2019 10:01:50 +0000
Message-ID: <8a72fd7b-91f3-d735-ac86-95c31f79fbbe@suse.com>
References: <30658b04-07ec-0b28-a6ad-3d78a106010c@suse.com>
	<36fd4936-e0cc-1f4d-98b3-e35f24c85e87@redhat.com>
In-Reply-To: <36fd4936-e0cc-1f4d-98b3-e35f24c85e87@redhat.com>
Content-Language: en-US
Content-ID: <7B09732A0340ED418B763988227ABD6E@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Question about filter behavior on pvcreate /dev/md0
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and
	development <linux-lvm@redhat.com>

Hello Zdenek,

Thank you for your reply. Your method works well.
I also understand the filter rules gradually.


On 6/14/19 4:51 PM, Zdenek Kabelac wrote:
> Dne 13. 06. 19 v 9:41 Heming Zhao napsal(a):
>> Hello List,
>>
>> I created a md device, and used pvcreate to format it.
>> But the pvcreate was failed with filter rules.
>> the filter in /etc/lvm/lvm.conf:
>> ```
>> filter = [ "r|/dev/.*/by-path/.*|", "r|/dev/.*/by-id/.*|",
>> "r|/dev/fd.*|", "r|/dev/cdrom|" ]
>> ```
> 
> 
> Hi
> 
> This filter mostly eliminates ANY block device you have in the system.
> The logic of filtering can be seen as puzzling, but please try to read 
> carefully comments in lvm.conf about filtering. It's explained there in 
> the great detail.
> 
> As soon as the 'accept' rule is seen - the device gets accepted.
> Otherwise if you remove device path - all it's associated clones will be 
> also removed.
> 
> So when you block device generates one of /dev/*/by-path access paths 
> (and I'd assume /dev/md0 should be) - it gets removed.
> 
> As 'quick fix' you can add 'a' rule for /dev/md.*...
> 
> Regards
> 
> Zdenek
> 
