Message-ID: <4C6BA754.9070301@redhat.com>
Date: Wed, 18 Aug 2010 10:26:44 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <4c6aee11.60d9.abeffb90.3576b179@olemiss.edu>
In-Reply-To: <4c6aee11.60d9.abeffb90.3576b179@olemiss.edu>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] linux-lvm Digest, Vol 78, Issue 4
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
Cc: Daksh Chauhan <daksh@olemiss.edu>

On 08/17/2010 09:16 PM, Daksh Chauhan wrote:
>> A little history and why I am asking the question in this list.
>> The customer needed to move from an existing SAN to a new SAN and wanted
>> as little as possible down time for the Application. So they zoned the
>> new SAN for access by the system and then added the new LUNs to the
>> existing Volume Group. Then ran the pvmove commands. It worked with no
>> problem on one of the PVs, but on the second one all the I/O hung at the
>> Application and any commands that access the LVM information such as
>> vgdisplay.
> 
> Why not use LVM mirroring? Checkout lvconvert...

Wrong tool for the job. There's currently no way to "split" an LVM2
mirror leaving two usable devices (without resorting to manual edits of
the metadata anyway).

Using pvmove is the right way to approach this problem with the current
tools and since it's going to be using the same kernel infrastructure to
shovel the data around there's no guarantee the user won't run into the
same kind of problem.

Regards,
Bryn.
