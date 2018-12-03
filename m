References: <CAB5m+-G1P9HJThW=hckE0yvBN-0VRCbQs4wEom1iO4NcF2U_7w@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <d12ad6cf-1e21-a335-5fbf-63ea064b3093@redhat.com>
Date: Mon, 3 Dec 2018 12:39:15 +0100
MIME-Version: 1.0
In-Reply-To: <CAB5m+-G1P9HJThW=hckE0yvBN-0VRCbQs4wEom1iO4NcF2U_7w@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] CoW under the hood
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Far Had <farhadk.it@gmail.com>

Dne 03. 12. 18 v 7:17 Far Had napsal(a):
> Hi,
> I'm trying to understand how LVM thick snapshots work under the hood. I can 
> see that when new write requests are comming to the original volume that has a 
> snapshot, the current contents of storage blocks copy to the snapshot space 
> then the new data overwrites on the volume. No problem so far.
> the question is when I delete a file on a volume that has snapshot, the 
> content is gone on the volume so the pointer which points from volume object 
> to that certain blocks on the volume should now point to empty blocks. On the 
> other hand I can see that the contents of deleted parts from the original 
> volume did not copy to the snapshot space, meaning that the snapshot pointers 
> that were pointing to that blocks on the original volume, still point that 
> direction.
> In other words the pointers from both snapshot and original volume are 
> pointing to the same blocks on the storage media but they don't show the same 
> contents when you mount them on the filesystem.
> Please enlighten me about this situation

Hi

I assume going through some info from this page might put some light into it:

http://people.redhat.com/agk/talks/


In particular http://people.redhat.com/agk/talks/FOSDEM_2005/
from slide 15  there is some info about snapshots you might find useful.

Regards

Zdenek
