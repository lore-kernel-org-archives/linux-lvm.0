References: <2048a92a-0505-78c3-da00-8bf2043f4cbf@yahoo.co.uk>
	<38e06f2a-5af9-6469-ec2c-5bde2c1b199b@gmail.com>
	<3e790d03-8da8-13c4-d1d3-e1f5f7b3c6f9@yahoo.co.uk>
	<7242e565-8540-74c1-d7db-39e84d029bf1@redhat.com>
	<a68b3d46-1e7a-1c48-7363-505ed8d27071@yahoo.co.uk>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <c26347b9-0e8e-7708-9f8a-0dfce05c1342@redhat.com>
Date: Tue, 11 Apr 2017 19:16:01 +0200
MIME-Version: 1.0
In-Reply-To: <a68b3d46-1e7a-1c48-7363-505ed8d27071@yahoo.co.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] stripped LV with segments vs one segment
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
To: LVM general discussion and development <linux-lvm@redhat.com>, peljasz@yahoo.co.uk

On 04/10/2017 03:35 PM, lejeczek wrote:
>
>
> On 10/04/17 13:27, Marian Csontos wrote:
>> On 04/10/2017 01:16 PM, lejeczek wrote:
>>
>>>
>>> I had 3 stripe LV, you know, three PVs, and wanted the LV to have 4
>>> stripes, wanted to add 4th PV, you can see it from above lvdisplay.
>>
>> What you want is "reshape" not extend. This was committed as RAID
>> feature to 2.02.169, but it is still somewhat experimental. You would
>> need to convert stripe LV to RAID0 (aka takeover) and then reshape.
>>
> thanks, I see it more clearly now.
> Is it possible to get rid of that second segment now? Have the LV prior
> to extension?

Either lvresize to previous size or vgcfgrestore would work UNLESS you 
resized the filesystem as well. vgcfgrestore has more limitations - no 
other metadata altering operations were performed on VG since the change.

Marian
