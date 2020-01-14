References: <CALZj-VrVhXLSBTthE5nsL9wQVaTr2XgJRULRFKvNqi9CCbvV5A@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <dc48ee9f-d290-b7af-6a3d-1b105cee2c26@redhat.com>
Date: Tue, 14 Jan 2020 13:21:49 +0100
MIME-Version: 1.0
In-Reply-To: <CALZj-VrVhXLSBTthE5nsL9wQVaTr2XgJRULRFKvNqi9CCbvV5A@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvreduce thin-pool
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Paul Dann <pdgiddie@gmail.com>

Dne 14. 01. 20 v 10:52 Paul Dann napsal(a):
> Hi there,
> 
> I've been following Ede Wolf's thread with interest, but it hasn't quite 
> covered my query, and I've not been able to find much about this in the archives:
> 
> Are there any plans to implement reducing of thin pools? I've been bitten 
> several times by carelessly allowing a thin pool to expand onto unsuitable 
> storage and subsequently being unable to reduce the pool again to ensure IO 
> performance of the pool. (I know that better forward planning can mitigate this.)
> 
> Mainly, I'm wondering if there are technical reasons this hasn't been 
> implemented yet? On the face of it, I'd have expected this to be a relatively 
> straight-forward procedure? But I'd be interested in why this might not be the 
> case.

Hi

There is no support for 'online' reduction of thin-pool. Mainly because there 
is not much interest into this.

For 'offline' reduction - you could probably write a tool working like this:

In kernel metadata figure out who holds the last 'chunk' and find what is the 
first 'empty' chunk - and copy the chunk there and remap all the references
to this last chunk to the new position.

Quite simple isn't  :) - the task would be probably simpler to code if it 
would be directly using thin tools from d-m-p-d package (i.e. thin_repair 
background)

So basically a straight forward process, someone just needs to do all the 
coding for this.

Regards

Zdenek
