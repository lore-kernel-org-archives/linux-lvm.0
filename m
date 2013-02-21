Message-ID: <5126245F.3050407@barfooze.de>
Date: Thu, 21 Feb 2013 14:42:55 +0100
From: John Spencer <maillist-lvm@barfooze.de>
MIME-Version: 1.0
References: <510D3B57.3020607@barfooze.de> <5116D92E.7040107@barfooze.de>
In-Reply-To: <5116D92E.7040107@barfooze.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] fix missing include directives
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
To: linux-lvm@redhat.com, agk@redhat.com

On 02/10/2013 12:18 AM, John Spencer wrote:
> On 02/02/2013 05:14 PM, John Spencer wrote:
>> on glibc, those are erroneously (namespace pollution) pulled in via
>> other headers. this doesn't work with conformant libcs (musl libc in
>> this case), we simply need to include all needed headers.
>>
>> Signed-Off-By: John Spencer <maillist-lvm@barfooze.de>
>>
>>
>
> ping
