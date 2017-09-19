References: <1118221441.5105826.1505831697387.ref@mail.yahoo.com>
	<1118221441.5105826.1505831697387@mail.yahoo.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <9829c699-8735-0f10-5515-3f24dc2de5a6@redhat.com>
Date: Tue, 19 Sep 2017 17:39:32 +0200
MIME-Version: 1.0
In-Reply-To: <1118221441.5105826.1505831697387@mail.yahoo.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Option to silence "WARNING: Sum of all thin volume
 sizes exceeds the size of thin pool"
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
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 19.9.2017 v 16:34 matthew patton napsal(a):
> LVM and thin in particular is not for noobies or novices. If they get burned then they deserve it for using a technology they didn't bother to study and learn 

Well it's not for novices ;) yet I believe  'lvm2' should not be an easy 
weapon for mass destruction for users data - we are then 'beaten' by rumors 
from the 'other side'

>"create succeeded". Create succeeded is indicated by a 0 return code. Anything else is just noise. If the user wants noise, then need to use the '-v|--verbose' flag.


lvcreate -q  is then likely  wanted  to be 'respected' as normally lvm2 tends 
to be a  bit  'conversational' command.

But I think  '-q'  should be respected and it's not  with this log_warn().

So I think  conversion to  log_print() level is possibly the goal here ??
(covering both side of stories).

Since as it's been said - we emit more lines per command even about successful 
'middle' steps.


Regards

Zdenek
