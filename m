Message-ID: <4E439CD7.2010105@redhat.com>
Date: Thu, 11 Aug 2011 11:11:51 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <883D98939E388E429EE8D771168A6560027EE6AE1D@USCMIMAIL1.corp.amdocs.com>	<4E42E454.7000902@redhat.com>
	<alpine.LRH.2.00.1108101650150.10808@bmsred.bmsi.com>
In-Reply-To: <alpine.LRH.2.00.1108101650150.10808@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] metadata copies
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
Cc: Jewsco Pius Jacquez <JewscoPius.Jacquez@Amdocs.com>

On 08/10/2011 11:00 PM, Stuart D. Gathman wrote:

> What happens if there are 2 or more metadata copies with the same sequence 
> ID, but different contents?  Not just buggy/malicious code can cause this.
> Imagine that a careless admin removes a PV, puts it on another system,
> independently updates both systems for a while, then later adds the PV back to
> the original system (and the seqnos match).

I did not mention two other checks:
- there is a checksum of text metadata in PV header, so random
corruption is detected

- the whole update process is atomic, there is a round buffer, new
version of metadata is written and if done successfully, atomic
sector update changes just pointer (so either new or old version is active)

> 2) I suspect there is no clever algorithm, and it probably uses the first
> valid copy seen with the highest sequence.  AIX had a "quorum" system 
> where the majority of metadata copies had to agree - or operator intervention
> was required to bring the VG online.

Metadata should be updated on all PVs when the code detect inconsistency.

TBH I am not sure if this happens in every malicious situation
(correct metadata versions with different content but the same ID).

Maybe if anyone want to try it - report a bug if there is a problem
handling it. (IMHO this check should be somehow added to vgck.)

Anyway, there is date, lvm version, full command and system name written
to text metadata (from the system where it was written), so manual admin
interaction should be trivial - just vgcfgrestore proper backup file.)

Milan
