References: <2c16a06f-271b-be18-a448-48acca16519c@linagora.com>
	<7b060cd7-a4b1-04ae-3a13-0fcd8637cad6@redhat.com>
	<40afe353-e750-1832-ba5a-1616695d46c4@linagora.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <d8224c32-56bd-4e53-1090-d86b2e904678@redhat.com>
Date: Tue, 9 Jul 2019 17:15:43 +0200
MIME-Version: 1.0
In-Reply-To: <40afe353-e750-1832-ba5a-1616695d46c4@linagora.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvdisplay "open" field computing
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
To: Simon ELBAZ <selbaz@linagora.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 09. 07. 19 v 17:12 Simon ELBAZ napsal(a):
> Thanks for your answer.
> 
>  From your explanation, open=2 should '"normally" not happen ?
> 
>

Not sure what is your exact use-case - is this LV mounted only on single 
mountpoint ?


What does lsof shows ?

dmsetup ls --tree ?



Regards

Zdenek
