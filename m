References: <CAGRSmLtZ9N7f6y+GpiZ-mVxW_-qh9h6LgTY=q+P39z4vDcK44w@mail.gmail.com>
	<CAGRSmLuo1ivu5eskvPMvNzmwOWFtUrnOEKUKHaTtjk7ynwc+BA@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <81231cae-0472-fb28-f14f-cf8354d4fe2c@redhat.com>
Date: Thu, 26 Jul 2018 10:58:24 +0200
MIME-Version: 1.0
In-Reply-To: <CAGRSmLuo1ivu5eskvPMvNzmwOWFtUrnOEKUKHaTtjk7ynwc+BA@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Trying to understand format of LVM2 - Question on
	Extent Size
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
To: LVM general discussion and development <linux-lvm@redhat.com>, "David F." <df7729@gmail.com>

Dne 26.7.2018 v 06:25 David F. napsal(a):
> Never mind, the answer is the extent_size is the number of sectors (or perhaps 
> it's the number of 512 byte blocks, I'll have to test on 4K sector 
> drives).     So in this case 4M and 4M*3840 is the 16G (not 16M which was the 
> 3840*4096).
> 
> On Wed, Jul 25, 2018 at 5:37 PM, David F. <df7729@gmail.com 

Hi


extent_size is always in 512b unit  and ATM it's 32b value.


extent_count is in 'extent_size' unit  and ATM it's 32b value.


Volume size    extent_size * extent_count   (so  32b * 32b =>  64b size).


Depending on your extent_size you are limiting maximum volume size.
Thus if you need to use  Exa byte volume sizes you clearly need to go with 4G 
extent size.


Regards


Zdenek
