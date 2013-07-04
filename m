Message-ID: <51D5384B.3070503@redhat.com>
Date: Thu, 04 Jul 2013 09:54:35 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <694672986.201875226.1372861755810.JavaMail.root@zimbra39-e7.priv.proxad.net>
	<1372877653.37850.YahooMailNeo@web181502.mail.ne1.yahoo.com>
In-Reply-To: <1372877653.37850.YahooMailNeo@web181502.mail.ne1.yahoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Resising underlying array
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
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 07/03/2013 07:54 PM, matthew patton wrote:
>> 200 MB for /boot was sensible years ago but now is a joke.
> 
> since when? All you need is 2 kernels. Have Linux 3.x kernels gotten
> out of hand? I only use RHEL/Centos5 and 6 and I've never even come
> close to running out.

It partly depends on the distro and features you use - e.g. Fedora has
preupgrade which uses /boot as temporary storage. This requires
considerably more space than was required in the past (if you are going
to use the feature - otherwise, carry on regardless :).

Regards,
Bryn.
