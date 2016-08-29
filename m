References: <575CAE9A.1060001@gmail.com>
	<9FC91B62-47F1-49D7-A346-153211D4D207@redhat.com>
	<3c8e6110-adbd-0bb5-e24e-655851edf340@yahoo.co.uk>
	<a1a1c9d00457985bf312ddde42c3e5ab@dds.nl>
	<1d81389a-48bd-9374-7c09-183926f9be1e@yahoo.co.uk>
	<1004ca527029b35e6d621a2629fd6ed4@dds.nl>
	<e41054b4-573e-1960-bd97-c669c6ae9249@yahoo.co.uk>
	<40998f97-9728-c1e6-1c94-cab31fdef870@redhat.com>
	<fda6b9fe-44c6-3274-748a-394a5717c48b@yahoo.co.uk>
From: Ondrej Kozina <okozina@redhat.com>
Message-ID: <08940795-857f-f519-5866-bc1a20f86b3b@redhat.com>
Date: Mon, 29 Aug 2016 13:22:56 +0200
MIME-Version: 1.0
In-Reply-To: <fda6b9fe-44c6-3274-748a-394a5717c48b@yahoo.co.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM cache/dm-cache questions.
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
To: peljasz@yahoo.co.uk
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 08/29/2016 11:42 AM, lejeczek wrote:
>
>
> On 26/08/16 15:45, Ondrej Kozina wrote:
>> On 08/26/2016 04:01 PM, lejeczek wrote:
>>> whatever you might call it, it works, luks encrypting,
>>> opening & mounting @boot - so I only wonder (which was my
>>> question) why not cache pool LVs. Is it not supported...
>>> would be great if a developer sees this question, I'm not
>>> sure jut yet about filing a bug report.
>>
>> In general LVM2 doesn't auto-activate or interpret unknown
>> device types. LUKS header is considered unknown from LVM2
>> perspective. Simply put LVM2 doesn't understand LUKS
>> header data. Not sure what you tried to do with cache pool
>> LV, but in my opinion any effort to encrypt (live or
>> detached) cache pool LV may end with severe data
>> corruption...
>>
>> As of now I think you have in general two options:
>>
>> a) encrypt both PVs because obviously if you only encrypt
>> the origin PV you end up with decrypted plaintext data
>> stored in cache pool. Probably this is the exact scenario
>> you were about to avoid?
>>
>> Unfortunately a) is suboptimal with regard to performance
>> since you'd perform the encryption of data blocks twice.
>>
>> Option b): encrypt the top level LV (the one constructed
>> from both cache and origin LV). This way ciphertext would
>> be stored twice in cache PV and origin PV but the
>> encryption would be performed only once.
>>
> gee, guys, thanks Ondrej,
> this I was saying from the beginning did not work - option b
> - does not work. I can Not encrypt top level cache pool LV.
> It does work with any other LV I have, but cache pool fails
> (like I said earlier) with:
>
> Command failed with code 22.

Could you post here 'lsblk' and 'lvs' output together with exact 
cryptsetup command you have executed to luksFormat your top level cached 
LV? Please add also --debug option among your original cryptsetup options.

Regards
Ondrej
