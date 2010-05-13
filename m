Message-ID: <4BEBE4F7.2040708@redhat.com>
Date: Thu, 13 May 2010 13:39:35 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <784380.93991.qm@web65513.mail.ac4.yahoo.com>
	<4BEAFFE5.3020406@redhat.com>
In-Reply-To: <4BEAFFE5.3020406@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvdisplay ignoring filter in /etc/lvm.conf?
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Don Hoover <dxh@yahoo.com>

On 05/12/2010 09:22 PM, Milan Broz wrote:
> On 05/12/2010 05:56 PM, Don Hoover wrote:
>> On futher-further testing..it appears that a "vgscan -vvvvvvvvvvvvvv"
>> does not update the lvm cache like it used too before RHEL 5.5.

It is only cluster lvm problem,
I filled that problem here https://bugzilla.redhat.com/show_bug.cgi?id=591861
Add to cc if interested.

Workaround for now is to manually remove that .cache file after filter change.

Thanks for reporting this,
Milan
