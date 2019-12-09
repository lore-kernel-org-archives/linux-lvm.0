References: <A8A53B0E4B7ACF4BAD5C77D3671AC8976ABE90D8@EX01.edgeware.tv>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <85c8a1e5-946b-cb38-87b6-90e46be7de6a@redhat.com>
Date: Mon, 9 Dec 2019 15:26:04 +0100
MIME-Version: 1.0
In-Reply-To: <A8A53B0E4B7ACF4BAD5C77D3671AC8976ABE90D8@EX01.edgeware.tv>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Best way to run LVM over multiple SW RAIDs?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Daniel Janzon <daniel.janzon@edgeware.tv>

On 12/9/19 11:26 AM, Daniel Janzon wrote:
> 

> The origin of my problem is indeed the poor performance of RAID5,
> which maxes out the single core the driver runs on. But if I accept that
> as a given, the next problem is LVM striping. Since I do get 10x better

What stripesize was used for striped LV? IIRC the default is 64k.

IIUC you are serving mostly large files. I have no numbers, and no HW to 
test the hypothesis, but using larger stripesize could help here as this 
would split the load on multiple RAID5 volumes, while not splitting the 
IOs too early into too many small requests.

-- Marian
