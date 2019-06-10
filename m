From: Heming Zhao <heming.zhao@suse.com>
Date: Mon, 10 Jun 2019 02:43:08 +0000
Message-ID: <448f9dc9-98c0-df99-d527-189bd2aa7a30@suse.com>
References: <3cc84c6a-62d0-96c2-cf6e-9181577f9802@suse.com>
	<662c133e-cebe-1882-a086-edb2219af7f0@redhat.com>
	<4e175852-fd38-2096-a174-046e10af941f@suse.com>
	<8b345d98-abf5-b3f8-50fc-5d86d20fd060@redhat.com>
	<c7b1ca31-b1b5-4964-1263-65b97ec3ed8d@suse.com>
	<d94cb5bd-b327-89e7-ceba-1f53060d060e@redhat.com>
In-Reply-To: <d94cb5bd-b327-89e7-ceba-1f53060d060e@redhat.com>
Content-Language: en-US
Content-ID: <7A4F444B113B5044AFBB8EBC2CC11932@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] confused with lvm2 filter rules
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
Content-Type: text/plain; charset="utf-8"
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and
	development <linux-lvm@redhat.com>

Hello Zdenek,

I totally got your point. Let's close this session.
Thank you for you reply.

Regards,
zhm

On 6/6/19 9:51 PM, Zdenek Kabelac wrote:
> Dne 06. 06. 19 v 15:30 Heming Zhao napsal(a):
>> Hello,
>>
>> the filter is:
>> filter = [ "r|/dev/.*/by-path/.*|", "r|/dev/.*/by-id/.*|",
>> "r|/dev/fd.*|", "r|/dev/cdrom|", "a/.*/" ]
>>
>> if filter doesn't contain "a/.*/":
>> - pvcreate, vgcreate & vgextend use regex filter to reject the disk.
>> (correct logic)
>> �> if filter contains "a/.*/":
>> - regex fileter pass the disk under pvcreate/vgcreate, create 
>> successfully.
>> - regex filter reject the disk under vgextend. (wrong. should create
>> successfuly)
>> - vgextend should do the same action as pvcreate/vgcreate.
> 
> Hi
> 
> As has been said -�� when you put� a|.*| as the last rule - it's doing 
> something different then you may think. So please do NOT test with such 
> filter (I've been even planning to add 'WARNING:' message when lvm2 
> would spot such filter....)
> 
>> log as below (with filter contain: "a/.*/"):
> 
> Not really interesting trace - the filter works correctly for this case.
> 
> The best advice is - DO NOT USE IT set this way.
> 
> Code is correct and there is no bug - it's just non-trivial to 
> understand what just filter is doing. Behavior cannot be changed without 
> causing regression for other users that set filters correctly.
> 
> So do you have any buggy trace for correctly set filter ?
> 
> Regards
> 
> Zdenek
> 
