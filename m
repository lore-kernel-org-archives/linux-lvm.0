References: <fee58e48-151f-9eab-a6a2-eb31c690029c@alteeve.ca>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <32651cc4-159f-a7f3-83cc-1e1c50071b93@redhat.com>
Date: Fri, 9 Oct 2020 16:43:52 +0200
MIME-Version: 1.0
In-Reply-To: <fee58e48-151f-9eab-a6a2-eb31c690029c@alteeve.ca>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM PV UUID problem
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Digimer <lists@alteeve.ca>

Dne 09. 10. 20 v 15:12 Digimer napsal(a):
> Hi all,
> 
>    I'm storing LVM information in a postgres database, and wanted to use
> the UUID from the PVs / VGs / LVs as the UUIDs in the database. I
> noticed when I tried to do this that postgres complained that the UUID
> was not valid. I checked with an online UUID validator
> (https://www.freecodeformat.com/validate-uuid-guid.php) and it also
> reported as invalid.
> 
> Example;
> 
> ====
> # pvdisplay | grep UUID
>    PV UUID               jLkli2-dEXx-5Y8n-pYlw-nCcy-9dFL-3B6jU3
> ====
> 
>    Is this a known issue?
> 

Hi

At the time of lvm2 devel I believe UUID was just a unique identifier,
later some effort to standardize it came in.

But really you should NOT be using basically internal unique identifiers
in your DB - this are internal to DM/LVM work and might be changed at any time 
to something else.

User is supposed to use  'vgname' & 'lvname'  - so there you can put those
valid UUID sequences - although human readable strings are always nicer ;)

Zdenek
