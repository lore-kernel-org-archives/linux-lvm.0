Received: from out.good-with-numbers.com (out.good-with-numbers.com [70.36.235.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0698637
	for <linux-lvm@lists.linux.dev>; Sat, 17 Aug 2024 02:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=70.36.235.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723861401; cv=none; b=sTJSzSUHb54QKQVv43yQS6X4o4mm+hQoEX6QyQZo0MDOLRLN8i2d19xIC++6y7lejHOu4AThOPgfi4bV5FeIAx0FMCNpBZm9FJnAswtSY/MvspsSvYC5e8kh2LNxN+GB2p9IDQTsatE7ehOkFHVkhmgV2x7jnJiPhkyABkXqLvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723861401; c=relaxed/simple;
	bh=oDdf79wkNmtQTV5XEjPln+8vrqmw7hPnSmIcnkSXSZ8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PZFAVY0dqWnHbK+G7aYcKOyjzp2v1dACGWU+f4/LdBQtWUFLy08OH0FiPsoMRLO4WDnlxTGdDZYh7vx3lyHJ90Qlcz8FgOaARn4be5suoi+fz7kbIrrJK/58pPyilf0VOb6R9qY2HIhG28Kbv3/e8W9iJn+/DjuuXo4Hy5kzbX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=good-with-numbers.com; spf=pass smtp.mailfrom=good-with-numbers.com; arc=none smtp.client-ip=70.36.235.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=good-with-numbers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=good-with-numbers.com
Date: Sat, 17 Aug 2024 02:19:50 +0000
From: debian@good-with-numbers.com
To: linux-lvm@lists.linux.dev
Subject: --autobackup option
Message-ID: <ZsAIwPIPOs36xR4R@70-36-235-101.dsl.static.fusionbroadband.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There's a --autobackup option on many of the LVM commands, e.g., lvcreate.
What does it do?  Does it set a flag on the LV so that all future operations
backup the metadata?  Or does it cause a one-off backup just for that
command?  The man page is ambiguous.  And vgcfgbackup(8) doesn't actually
describe it.
