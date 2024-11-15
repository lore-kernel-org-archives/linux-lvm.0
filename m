Received: from plutone.assyoma.it (cloud.assyoma.it [212.237.56.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4166717E010
	for <linux-lvm@lists.linux.dev>; Fri, 15 Nov 2024 20:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.237.56.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731701774; cv=none; b=t4yo8Y2AV1Qq7X4lP1E2E3lu/5/M+np8mimr7vbTU7xc4/rer/f7cU7zwPEjhm0WIm9HckIGzNSAlWtMcNn1aEaUPPecN8B2YC+H4GFPem1tQtMgCzyp7heJ5ueZyFqfj2dwht54paOEhf3WRLIjjML0sWo3QRgNbHMy98NfGME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731701774; c=relaxed/simple;
	bh=XeWdnN5goLX1tjQqHquIlmVW2ov4iPGhV+VlOvjwlb8=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=k3pi08xky1WYP7Ef7qdXjg4EHHV2aAjXTYZ2ITS6l/HL31K4sbX5K6Kp1HLunvtHG163MwfVdksjAk86D+y4uwuLsnbogkBqh3kRYZRYAfS8lXk2QrN/dsLS4fauNZWCtWgSMo/K2j7dGRdz5NbHukgwvvYKVOfyWNX15LAPmf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it; spf=pass smtp.mailfrom=assyoma.it; arc=none smtp.client-ip=212.237.56.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=assyoma.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=assyoma.it
Received: from webmail.assyoma.it (localhost [IPv6:::1])
	by plutone.assyoma.it (Postfix) with ESMTP id E6442C09BEFB
	for <linux-lvm@lists.linux.dev>; Fri, 15 Nov 2024 21:07:10 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 15 Nov 2024 21:07:10 +0100
From: Gionatan Danti <g.danti@assyoma.it>
To: linux-lvm@lists.linux.dev
Subject: Import duplicate VG from a read-only device
Message-ID: <65d1cd8d1b9189ffcd7eb919c91c1b59@assyoma.it>
X-Sender: g.danti@assyoma.it
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi list,
is it possible to import a duplicate VG name from a read-only device?

I know about vgrename, but it needs to update metadata - which is not 
possible for read-only device.

I tried to un-manage the host native read/write VG, deleting it from 
system.devices, but lvchange -ay shown an error about not being able to 
create the /dev/VG/LV symlink (and a "device busy" issue, probably 
related to the already-existing symlink). I also tried to activate the 
specific LV via lvchange -S lv_uuid, but it shown the same error as 
above.

In this specific case I put the device in r/w mode and solved the issue 
with a plain vgrename. But what if I could not enable writes on the 
device? Is the only solution to mount it on a machine without the same 
VG name (ie: on a live USB), or can a VG/LV be enabled specifying a 
different path for the symlink?

Thanks.
